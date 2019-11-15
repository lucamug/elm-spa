module UI.Card exposing
    ( high
    , low
    , normal
    )

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html.Attributes
import UI.Color
import UI.Shadow


cardBase : List (Attribute msg)
cardBase =
    [ padding 30
    , Background.color UI.Color.backgroundCard
    , Border.rounded 10
    , Border.width 1
    , Border.color UI.Color.border
    , width fill
    , htmlAttribute <| Html.Attributes.style "transition" "all 0.2s"
    , Font.color UI.Color.fontNormal
    ]


normal : List (Attribute msg)
normal =
    cardBase
        ++ [ UI.Shadow.low, mouseOver [ UI.Shadow.high ] ]


low : List (Attribute msg)
low =
    cardBase
        ++ [ UI.Shadow.low ]


high : List (Attribute msg)
high =
    cardBase
        ++ [ UI.Shadow.high ]
