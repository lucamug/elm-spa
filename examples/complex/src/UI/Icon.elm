module UI.Icon exposing
    ( grid
    , notice_generic_l_
    , search_
    )

import Svg
import Svg.Attributes as SA


wrapperWithViewbox : String -> Int -> List (Svg.Svg msg) -> Svg.Svg msg
wrapperWithViewbox viewbox size listSvg =
    Svg.svg
        [ SA.xmlSpace "http://www.w3.org/2000/svg"
        , SA.viewBox viewbox
        , SA.height <| String.fromInt size
        , SA.preserveAspectRatio "xMinYMin slice"
        ]
        listSvg


grid : String -> Int -> Svg.Svg msg
grid color size =
    wrapperWithViewbox
        "0 0 24 24"
        size
        [ Svg.path [ SA.fill color, SA.d "M6,8c1.1,0 2,-0.9 2,-2s-0.9,-2 -2,-2 -2,0.9 -2,2 0.9,2 2,2zM12,20c1.1,0 2,-0.9 2,-2s-0.9,-2 -2,-2 -2,0.9 -2,2 0.9,2 2,2zM6,20c1.1,0 2,-0.9 2,-2s-0.9,-2 -2,-2 -2,0.9 -2,2 0.9,2 2,2zM6,14c1.1,0 2,-0.9 2,-2s-0.9,-2 -2,-2 -2,0.9 -2,2 0.9,2 2,2zM12,14c1.1,0 2,-0.9 2,-2s-0.9,-2 -2,-2 -2,0.9 -2,2 0.9,2 2,2zM16,6c0,1.1 0.9,2 2,2s2,-0.9 2,-2 -0.9,-2 -2,-2 -2,0.9 -2,2zM12,8c1.1,0 2,-0.9 2,-2s-0.9,-2 -2,-2 -2,0.9 -2,2 0.9,2 2,2zM18,14c1.1,0 2,-0.9 2,-2s-0.9,-2 -2,-2 -2,0.9 -2,2 0.9,2 2,2zM18,20c1.1,0 2,-0.9 2,-2s-0.9,-2 -2,-2 -2,0.9 -2,2 0.9,2 2,2z" ] []
        ]



-- ReX Icons


notice_generic_l_ : String -> Int -> Svg.Svg msg
notice_generic_l_ cl size =
    wrapperWithViewbox
        "0 0 32 32"
        size
        [ Svg.path [ SA.fill "none", SA.d "M0 0h32v32H0z" ] []
        , Svg.path [ SA.fill cl, SA.d "M16 28a2 2 0 0 1-2-2h-2a4 4 0 0 0 8 0h-2a2 2 0 0 1-2 2zm10-8v-8a10 10 0 0 0-20 0v8a2 2 0 0 1-2 2v2h24v-2a2 2 0 0 1-2-2zM7.46 22A3.98 3.98 0 0 0 8 20v-8a8 8 0 0 1 16 0v8a3.98 3.98 0 0 0 .54 2z" ] []
        ]


search_ : String -> Int -> Svg.Svg msg
search_ cl size =
    wrapperWithViewbox
        "0 0 32 32"
        size
        [ Svg.path [ SA.fill cl, SA.d "M13 2a11 11 0 1 0 11 11A11 11 0 0 0 13 2zm0 20a9 9 0 1 1 9-9 9.01 9.01 0 0 1-9 9zm9.86-.55a13.11 13.11 0 0 1-1.41 1.41L28.59 30 30 28.59z" ] []
        , Svg.path [ SA.fill "none", SA.d "M0 0h32v32H0z" ] []
        ]
