module Components.NotificationsMenu exposing (view)

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
                    [ text "Notification 1"
                    , text "Notification 2"
                    , text "Notification 3"
                    ]
        ]

    else
        []
