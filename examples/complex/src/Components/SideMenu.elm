module Components.SideMenu exposing (view)

import Element exposing (..)
import Element.Border as Border
import Generated.Route
import Generated.Route.Settings
import UI.Attrs
import UI.Card
import UI.Padding


attrs : List (Attribute msg)
attrs =
    UI.Attrs.link ++ [ paddingXY UI.Padding.large UI.Padding.normal, width fill ]


viewLink : ( String, Generated.Route.Route ) -> Element msg
viewLink ( label, route ) =
    link attrs { url = Generated.Route.toPath route, label = text label }


view : Element msg
view =
    column
        (UI.Card.high ++ [ Border.rounded 0, scrollbarY, paddingXY 0 UI.Padding.normal ])
    <|
        List.map
            viewLink
            [ ( "☰ Home", Generated.Route.Index () )
            , ( "☰ Counter", Generated.Route.Counter () )
            , ( "☰ Cats", Generated.Route.Random () )
            , ( "☰ Settings", Generated.Route.Settings (Generated.Route.Settings.Account ()) )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            , ( "☰ Menu Item", Generated.Route.Index () )
            ]
