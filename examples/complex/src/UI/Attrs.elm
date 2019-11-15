module UI.Attrs exposing
    ( appName
    , button
    , headerMenu
    , link
    , normal
    , subTitle
    , title
    )

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html.Attributes
import UI.Color
import UI.Font
import UI.Padding


appName : List (Element.Attr decorative msg)
appName =
    [ Font.size UI.Font.xxLarge
    , Font.color UI.Color.fontHeaderBright
    ]


headerMenu : List (Element.Attr decorative msg)
headerMenu =
    [ Font.size UI.Font.large
    , Font.color UI.Color.fontHeader
    ]


title : List (Element.Attr decorative msg)
title =
    [ Font.size UI.Font.xLarge
    , Font.color UI.Color.fontTitle
    ]


subTitle : List (Element.Attr decorative msg)
subTitle =
    [ Font.size UI.Font.large
    , Font.color UI.Color.fontTitle
    ]


normal : List (Element.Attr decorative msg)
normal =
    [ Font.size UI.Font.medium
    , Font.color UI.Color.fontNormal
    ]


button : List (Attribute msg)
button =
    [ Border.width 1
    , Border.color UI.Color.border
    , Border.rounded 5
    , paddingXY UI.Padding.normal UI.Padding.small
    , htmlAttribute <| Html.Attributes.style "transition" "all 0.2s"
    , mouseOver [ Background.color <| rgba 0 0 0 0.1 ]
    ]


link : List (Attribute msg)
link =
    [ paddingXY UI.Padding.normal UI.Padding.small
    , htmlAttribute <| Html.Attributes.style "transition" "all 0.2s"
    , mouseOver [ Background.color <| rgba 0 0 0 0.1 ]
    ]
