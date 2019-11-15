module Components.Navbar exposing (view)

import Components.ApplicationsMenu
import Components.NotificationsMenu
import Counter
import Counter.View
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Generated.Route
import Html
import Html.Attributes
import UI.Attrs
import UI.Color
import UI.Icon
import UI.Logo
import UI.Padding
import UI.Size
import UI.Spacing


view : Maybe Counter.Counter -> Bool -> Bool -> Element msg
view maybeCounter isApplicationsMenuOpen isNotificationsMenuOpen =
    row
        [ width fill
        , paddingXY UI.Padding.large 0
        , height <| px UI.Size.headerHeight
        , spacing UI.Spacing.large
        , Background.color <| UI.Color.backgroundHeader
        , Font.color <| UI.Color.fontHeader
        , htmlAttribute <| Html.Attributes.style "position" "fixed"
        , htmlAttribute <| Html.Attributes.style "z-index" "1"
        ]
        [ el [ Font.size 30, centerX, moveUp 2 ] <| text "☰"
        , link []
            { label =
                row [ spacing 10 ]
                    [ el [ moveDown 3 ] <| html <| UI.Logo.rakuten "#fff" 30
                    , el (UI.Attrs.appName ++ []) <| text "Membership"
                    ]
            , url = Generated.Route.toPath <| Generated.Route.Top {}
            }
        , row
            [ padding 10
            , spacing 10
            , Border.rounded 10
            , Background.color UI.Color.background
            , width fill
            ]
            [ el [] <| html <| UI.Icon.search_ "rgb(100,100,100)" 30
            , el [ width fill ] <|
                html <|
                    Html.input
                        [ Html.Attributes.style "border" "0px"
                        , Html.Attributes.style "font-size" "20px"
                        , Html.Attributes.style "background-color" "rgb(230,230,230)"
                        ]
                        []
            ]
        , row
            [ alignRight
            , centerX
            , spacing UI.Spacing.normal
            ]
            [ case maybeCounter of
                Just counter ->
                    Counter.View.view counter 18

                Nothing ->
                    none
            , el
                (Components.NotificationsMenu.view isNotificationsMenuOpen)
              <|
                html <|
                    UI.Icon.notice_generic_l_ UI.Color.fontHeaderAsString 30
            , el
                (Components.ApplicationsMenu.view isApplicationsMenuOpen)
              <|
                html <|
                    UI.Icon.grid UI.Color.fontHeaderAsString 30
            , link
                []
                { url = ""
                , label =
                    image
                        [ width <| px 45
                        , height <| px 45
                        , clip
                        , Border.rounded 64
                        ]
                        { src = "images/office-worker.png", description = "" }
                }
            ]
        ]
