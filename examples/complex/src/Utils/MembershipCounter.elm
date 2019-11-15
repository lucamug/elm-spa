port module Utils.MembershipCounter exposing
    ( init
    , updateOnAnimationFrame
    , updateOnWebsocket
    , wsreceive
    )

import Counter
import Json.Decode
import Json.Decode.Pipeline
import Json.Encode
import WebSocket


port receiveSocketMsg : (Json.Decode.Value -> msg) -> Sub msg


port sendSocketCommand : Json.Encode.Value -> Cmd msg


type alias CounterData =
    { message : String
    , total : Int
    , iPAddress : String
    , regFrom : String
    , systemId : String
    }


decodeCounterData : Json.Decode.Decoder CounterData
decodeCounterData =
    Json.Decode.succeed CounterData
        |> Json.Decode.Pipeline.required "Message" Json.Decode.string
        |> Json.Decode.Pipeline.required "Total" Json.Decode.int
        |> Json.Decode.Pipeline.required "IPAddress" Json.Decode.string
        |> Json.Decode.Pipeline.required "RegFrom" Json.Decode.string
        |> Json.Decode.Pipeline.required "SystemId" Json.Decode.string


init : Cmd msg
init =
    wssend <|
        WebSocket.Connect
            { name = "Counter"
            , address = "ws://membership-counter.id.intra.rakuten-it.com:8080/items"
            , protocol = ""
            }


updateOnAnimationFrame : Maybe Counter.Counter -> Maybe Counter.Counter
updateOnAnimationFrame maybeCounter =
    case maybeCounter of
        Nothing ->
            Nothing

        Just counter ->
            Just <| Counter.update counter


updateOnWebsocket : Maybe Counter.Counter -> Result Json.Decode.Error WebSocket.WebSocketMsg -> Maybe Counter.Counter
updateOnWebsocket maybeCounter result =
    case result of
        Ok data ->
            case data of
                WebSocket.Data data2 ->
                    case Json.Decode.decodeString decodeCounterData data2.data of
                        Ok data3 ->
                            case maybeCounter of
                                Nothing ->
                                    Counter.init
                                        |> Counter.jumpTo data3.total
                                        |> Counter.start
                                        |> Just

                                Just counter ->
                                    Just <| Counter.moveTo data3.total counter

                        Err _ ->
                            maybeCounter

                WebSocket.Error _ ->
                    maybeCounter

        Err _ ->
            maybeCounter


wsreceive : (Result Json.Decode.Error WebSocket.WebSocketMsg -> msg) -> Sub msg
wsreceive msg =
    receiveSocketMsg <| WebSocket.receive msg


wssend : WebSocket.WebSocketCmd -> Cmd msg
wssend =
    WebSocket.send sendSocketCommand
