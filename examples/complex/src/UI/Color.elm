module UI.Color exposing
    ( background
    , backgroundCard
    , backgroundHeader
    , border
    , fontHeader
    , fontHeaderAsString
    , fontHeaderBright
    , fontNormal
    , fontTitle
    )

import Element


fontTitle : Element.Color
fontTitle =
    Element.rgba 0 0 0 0.5


fontNormal : Element.Color
fontNormal =
    Element.rgba 0 0 0 0.8


fontHeaderBright : Element.Color
fontHeaderBright =
    Element.rgba 1 1 1 0.9


fontHeader : Element.Color
fontHeader =
    Element.rgba 1 1 1 0.8


fontHeaderAsString : String
fontHeaderAsString =
    "rgba(255,255,255,0.8)"


border : Element.Color
border =
    Element.rgba 0 0 0 0.2


backgroundHeader : Element.Color
backgroundHeader =
    Element.rgba 1 0.2 0.4 0.8


background : Element.Color
background =
    Element.rgb 0.9 0.9 0.9


backgroundCard : Element.Color
backgroundCard =
    Element.rgb 1 1 1
