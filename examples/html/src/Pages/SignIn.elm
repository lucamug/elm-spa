module Pages.SignIn exposing
    ( Model
    , Msg
    , page
    )

import Application.Page as Page
import Generated.Route as Route
import Global
import Html exposing (..)
import Html.Attributes as Attr
import Html.Events as Events
import Utils.Cmd


type alias Model =
    { username : String
    , password : String
    }


type Msg
    = Updated Field String
    | FormSubmitted


type Field
    = Username
    | Password


page =
    Page.component
        { title = title
        , init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


init : Global.Model -> () -> ( Model, Cmd Msg, Cmd Global.Msg )
init _ _ =
    ( { username = ""
      , password = ""
      }
    , Cmd.none
    , Cmd.none
    )


update : Global.Model -> Msg -> Model -> ( Model, Cmd Msg, Cmd Global.Msg )
update _ msg model =
    case msg of
        Updated Username username ->
            ( { model | username = username }
            , Cmd.none
            , Cmd.none
            )

        Updated Password password ->
            ( { model | password = password }
            , Cmd.none
            , Cmd.none
            )

        FormSubmitted ->
            ( model
            , Cmd.none
            , Utils.Cmd.send <| Global.NavigateTo (Route.Index ())
            )


subscriptions : Global.Model -> Model -> Sub Msg
subscriptions _ _ =
    Sub.none


title : Global.Model -> Model -> String
title global _ =
    case global.user of
        Just _ ->
            "Sign out"

        Nothing ->
            "Sign in"


view : Global.Model -> Model -> Html Msg
view _ model =
    div []
        [ h1 [] [ text "Sign in" ]
        , Html.form
            [ Events.onSubmit FormSubmitted ]
            [ viewInput
                { label = "Username"
                , value = model.username
                , onInput = Updated Username
                , type_ = "text"
                }
            , viewInput
                { label = "Password"
                , value = model.password
                , onInput = Updated Password
                , type_ = "password"
                }
            , button [] [ text "Sign in" ]
            ]
        ]


viewInput :
    { label : String
    , value : String
    , onInput : String -> msg
    , type_ : String
    }
    -> Html msg
viewInput config =
    label
        [ Attr.style "display" "flex"
        , Attr.style "flex-direction" "column"
        , Attr.style "align-items" "flex-start"
        , Attr.style "margin" "1rem 0"
        ]
        [ span [] [ text config.label ]
        , input
            [ Attr.type_ config.type_
            , Events.onInput config.onInput
            , Attr.value config.value
            ]
            []
        ]
