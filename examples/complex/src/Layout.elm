module Layout exposing (view)

import App.Page
import Components.Button
import Components.Navbar
import Components.SideMenu
import Components.Styles as Styles
import Counter
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Global
import Html.Attributes
import UI.Color
import UI.Padding
import UI.Size


navBar :
    { a
        | isApplicationsMenuOpen : Bool
        , isNotificationsMenuOpen : Bool
        , isSideMenuOpen : Bool
        , maybeCounter : Maybe Counter.Counter
    }
    -> Element Global.Msg
navBar global =
    Components.Navbar.view global.maybeCounter global.isApplicationsMenuOpen global.isNotificationsMenuOpen


sideMenu : { a | isSideMenuOpen : Bool } -> Element msg
sideMenu global =
    el
        ([ htmlAttribute <| Html.Attributes.style "position" "fixed"
         , htmlAttribute <| Html.Attributes.style "z-index" "1"
         , htmlAttribute <| Html.Attributes.style "top" (String.fromInt UI.Size.headerHeight ++ "px")
         , htmlAttribute <| Html.Attributes.style "height" "100vh"
         , htmlAttribute <| Html.Attributes.style "transition" "all 0.2s"
         , paddingEach { top = 0, right = 0, bottom = UI.Size.headerHeight, left = 0 }
         , width <| px UI.Size.sideMenuWidth
         ]
            ++ (if global.isSideMenuOpen then
                    []

                else
                    [ moveLeft <| toFloat UI.Size.sideMenuWidth ]
               )
        )
    <|
        Components.SideMenu.view


page_ : { a | isSideMenuOpen : Bool } -> Element msg -> Element msg
page_ global page =
    el
        [ htmlAttribute <| Html.Attributes.style "transition" "all 0.2s"
        , paddingEach
            { top = UI.Padding.large + UI.Size.headerHeight
            , right = UI.Padding.large
            , bottom = UI.Padding.large
            , left =
                UI.Padding.large
                    + (if global.isSideMenuOpen then
                        UI.Size.sideMenuWidth

                       else
                        0
                      )
            }
        , width fill
        , Background.color UI.Color.background
        , alignTop
        ]
    <|
        page


view : Context msg -> Element msg
view { page, global, toMsg } =
    column
        [ width fill ]
        [ Element.map toMsg <| navBar global
        , sideMenu global
        , page_ global page
        ]



--


type alias Context msg =
    { page : Element msg
    , global : Global.Model
    , toMsg : Global.Msg -> msg
    }



-- view2 : Context msg -> Element msg
-- view2 { page, global, toMsg } =
--     column
--         [ Font.size 16
--         , Font.color Styles.colors.jet
--         , Font.family Styles.fonts.sans
--         , paddingEach
--             { top = 32
--             , left = 16
--             , right = 16
--             , bottom = 128
--             }
--         , spacing 32
--         , width (fill |> maximum 640)
--         , height fill
--         , centerX
--         ]
--         [ Element.map toMsg (Components.Navbar.view Nothing False False)
--
--         -- , Element.map toMsg (viewNavbar global.user)
--         , page
--         ]
--
--
-- viewNavbar : Maybe String -> Element Global.Msg
-- viewNavbar user_ =
--     row
--         [ width fill
--         , spacing 24
--         ]
--         [ row [ Font.size 18, spacing 24 ] <|
--             (link
--                 [ Font.size 20
--                 , Font.semiBold
--                 , Font.color Styles.colors.coral
--                 , Styles.transition
--                     { property = "opacity"
--                     , speed = 150
--                     }
--                 , mouseOver [ alpha 0.6 ]
--                 ]
--                 { label = text "elm-spa"
--                 , url = "/"
--                 }
--                 :: List.map viewLink
--                     [ ( "xxxdocs", "/docs" )
--                     , ( "guide", "/guide" )
--                     ]
--             )
--         , el [ alignRight ] <|
--             case user_ of
--                 Just name ->
--                     Components.Button.view
--                         { onPress = Just Global.SignOut
--                         , label = text ("sign out " ++ name)
--                         }
--
--                 Nothing ->
--                     viewButtonLink ( "sign in", "/sign-in" )
--         ]
--
--
-- viewLink : ( String, String ) -> Element msg
-- viewLink ( label, url ) =
--     link Styles.link
--         { url = url
--         , label = text label
--         }
--
--
-- viewButtonLink : ( String, String ) -> Element msg
-- viewButtonLink ( label, url ) =
--     link Styles.button
--         { url = url
--         , label = text label
--         }
--
--
-- transition :
--     { property : String, speed : Int }
--     -> Element.Attribute msg
-- transition { property, speed } =
--     Element.htmlAttribute
--         (Html.Attributes.style
--             "transition"
--             (property ++ " " ++ String.fromInt speed ++ "ms ease-in-out")
--         )
