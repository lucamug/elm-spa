module Generated.Docs.Pages exposing
    ( Model
    , Msg
    , page
    )

import App.Page
import Layouts.Docs as Layout
import Utils.Spa as Spa
import Generated.Docs.Params as Params
import Generated.Docs.Route as Route exposing (Route)
import Pages.Docs.Dynamic
import Pages.Docs.Static




type Model
    = DynamicModel Pages.Docs.Dynamic.Model
    | StaticModel Pages.Docs.Static.Model


type Msg
    = DynamicMsg Pages.Docs.Dynamic.Msg
    | StaticMsg Pages.Docs.Static.Msg


page : Spa.Page Route Model Msg layoutModel layoutMsg appMsg
page =
    Spa.layout
        { view = Layout.view
        , recipe =
            { init = init
            , update = update
            , bundle = bundle
            }
        }



-- RECIPES


type alias Recipe flags model msg appMsg =
    Spa.Recipe flags model msg Model Msg appMsg


type alias Recipes msg =
    { dynamic : Recipe Params.Dynamic Pages.Docs.Dynamic.Model Pages.Docs.Dynamic.Msg msg
    , static : Recipe Params.Static Pages.Docs.Static.Model Pages.Docs.Static.Msg msg
    }


recipes : Recipes msg
recipes =
    { dynamic =
        Spa.recipe
            { page = Pages.Docs.Dynamic.page
            , toModel = DynamicModel
            , toMsg = DynamicMsg
            }
    , static =
        Spa.recipe
            { page = Pages.Docs.Static.page
            , toModel = StaticModel
            , toMsg = StaticMsg
            }
    }



-- INIT


init : Route -> Spa.Init Model Msg
init route_ =
    case route_ of
        Route.Static params ->
            recipes.static.init params
        
        Route.Dynamic _ params ->
            recipes.dynamic.init params



-- UPDATE


update : Msg -> Model -> Spa.Update Model Msg
update bigMsg bigModel =
    case ( bigMsg, bigModel ) of
        ( StaticMsg msg, StaticModel model ) ->
            recipes.static.update msg model
        
        ( DynamicMsg msg, DynamicModel model ) ->
            recipes.dynamic.update msg model
        _ ->
            App.Page.keep bigModel


-- BUNDLE


bundle : Model -> Spa.Bundle Msg msg
bundle bigModel =
    case bigModel of
        StaticModel model ->
            recipes.static.bundle model
        
        DynamicModel model ->
            recipes.dynamic.bundle model