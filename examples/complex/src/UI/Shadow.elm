module UI.Shadow exposing
    ( high
    , low
    )

import Element exposing (..)
import Element.Border as Border


high : Attr decorative msg
high =
    Border.shadow
        { color = rgba255 0 0 0 0.3
        , offset = ( 0, 10 )
        , blur = 10
        , size = 1
        }


low : Attr decorative msg
low =
    Border.shadow
        { color = rgba255 0 0 0 0.1
        , offset = ( 0, 0 )
        , blur = 3
        , size = 1
        }
