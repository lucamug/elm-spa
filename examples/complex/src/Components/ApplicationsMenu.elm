module Components.ApplicationsMenu exposing (view)

import Element exposing (..)
import Element.Font as Font
import UI.Card


view : Bool -> List (Attribute msg)
view show =
    if show then
        [ below <|
            el
                (UI.Card.high ++ [ alignRight, width shrink ])
            <|
                column [ spacing 20 ]
                    [ row [ spacing 20 ]
                        [ column [ Font.center, spacing 10 ]
                            [ image [ width <| px 60, height <| px 60 ] { src = "images/blackbox-logo.png", description = "Blackbox" }
                            , el [ width fill ] <| text "Blackbox"
                            ]
                        , column [ Font.center, spacing 10 ]
                            [ image [ width <| px 60, height <| px 60 ] { src = "images/omni-logo.png", description = "Omni" }
                            , el [ width fill ] <| text "Omni"
                            ]
                        , column [ Font.center, spacing 10 ]
                            [ image [ width <| px 60, height <| px 60 ] { src = "images/cat-logo.png", description = "Cat" }
                            , el [ width fill ] <| text "Cat"
                            ]
                        ]
                    , row [ spacing 20 ]
                        [ column [ Font.center, spacing 10 ]
                            [ image [ width <| px 60, height <| px 60 ] { src = "images/omni-logo.png", description = "Omni" }
                            , el [ width fill ] <| text "Omni"
                            ]
                        , column [ Font.center, spacing 10 ]
                            [ image [ width <| px 60, height <| px 60 ] { src = "images/cat-logo.png", description = "Cat" }
                            , el [ width fill ] <| text "Cat"
                            ]
                        , column [ Font.center, spacing 10 ]
                            [ image [ width <| px 60, height <| px 60 ] { src = "images/blackbox-logo.png", description = "Blackbox" }
                            , el [ width fill ] <| text "Blackbox"
                            ]
                        ]
                    ]
        ]

    else
        []
