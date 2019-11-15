module Components.SideMenu exposing (view)

import Element exposing (..)
import Element.Border as Border
import Generated.Route
import UI.Attrs
import UI.Card
import UI.Padding


attrs : List (Attribute msg)
attrs =
    UI.Attrs.link ++ [ paddingXY UI.Padding.large UI.Padding.normal, width fill ]



-- viewLink : ( String, Generated.Route.Route ) -> Element msg
-- viewLink ( label, route ) =
--     link attrs { url = Generated.Route.toPath route, label = text label }


viewLink : ( String, String ) -> Element msg
viewLink ( label, url ) =
    link attrs { url = url, label = text label }


view : Element msg
view =
    column
        (UI.Card.high ++ [ Border.rounded 0, scrollbarY, paddingXY 0 UI.Padding.normal ])
    <|
        List.map
            viewLink
            [ ( "☰ Home", "" )
            , ( "☰ Counter", "" )
            , ( "☰ Cats", "" )
            , ( "☰ Settings", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            , ( "☰ Menu Item", "" )
            ]
