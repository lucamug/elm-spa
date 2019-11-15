module Global exposing
    ( Flags
    , Model
    , Msg(..)
    , init
    , subscriptions
    , update
    )

import Browser.Events
import Counter
import Generated.Routes as Routes exposing (Route, routes)
import Json.Decode
import Time
import Utils.MembershipCounter
import WebSocket



-- type alias Flags =
--     { width : Int
--     , baseHref : String
--     }


type alias Flags =
    ()


type alias Model =
    { user : Maybe String
    , maybeCounter : Maybe Counter.Counter
    , isApplicationsMenuOpen : Bool
    , isNotificationsMenuOpen : Bool
    , isSideMenuOpen : Bool
    , width : Int
    , baseHref : String
    }


type Msg
    = SignIn String
    | SignOut
    | OnAnimationFrame Time.Posix
    | Websocket (Result Json.Decode.Error WebSocket.WebSocketMsg)
    | ToggleMenuApplications
    | ToggleMenuNotifications
    | ToggleMenuSide
    | OnResize Int Int


type alias Commands msg =
    { navigate : Route -> Cmd msg
    }


init : Commands msg -> Flags -> ( Model, Cmd Msg, Cmd msg )
init _ _ =
    let
        flags =
            { width = 800
            , baseHref = ""
            }
    in
    ( { user = Nothing
      , maybeCounter = Nothing
      , isApplicationsMenuOpen = False
      , isNotificationsMenuOpen = False
      , isSideMenuOpen = flags.width > 1000
      , width = flags.width
      , baseHref = flags.baseHref
      }
    , Utils.MembershipCounter.init
    , Cmd.none
    )


update : Commands msg -> Msg -> Model -> ( Model, Cmd Msg, Cmd msg )
update commands msg model =
    case msg of
        SignIn user ->
            ( { model | user = Just user }
            , Cmd.none
            , commands.navigate routes.top
            )

        SignOut ->
            ( { model | user = Nothing }
            , Cmd.none
            , Cmd.none
            )

        OnResize x _ ->
            ( { model | width = x }
            , Cmd.none
            , Cmd.none
            )

        ToggleMenuApplications ->
            ( { model
                | isApplicationsMenuOpen = not model.isApplicationsMenuOpen
                , isNotificationsMenuOpen = False
              }
            , Cmd.none
            , Cmd.none
            )

        ToggleMenuNotifications ->
            ( { model
                | isNotificationsMenuOpen = not model.isNotificationsMenuOpen
                , isApplicationsMenuOpen = False
              }
            , Cmd.none
            , Cmd.none
            )

        ToggleMenuSide ->
            ( { model | isSideMenuOpen = not model.isSideMenuOpen }
            , Cmd.none
            , Cmd.none
            )

        OnAnimationFrame _ ->
            ( { model | maybeCounter = Utils.MembershipCounter.updateOnAnimationFrame model.maybeCounter }
            , Cmd.none
            , Cmd.none
            )

        Websocket result ->
            ( { model | maybeCounter = Utils.MembershipCounter.updateOnWebsocket model.maybeCounter result }
            , Cmd.none
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        ([ Utils.MembershipCounter.wsreceive Websocket
         , Browser.Events.onResize OnResize
         ]
            ++ (case model.maybeCounter of
                    Nothing ->
                        []

                    Just counter ->
                        if Counter.areMoving [ counter ] then
                            [ Browser.Events.onAnimationFrame OnAnimationFrame ]

                        else
                            []
               )
        )
