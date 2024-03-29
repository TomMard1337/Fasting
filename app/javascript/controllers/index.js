// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ConverterController from "./converter_controller"
application.register("converter", ConverterController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ResetController from "./reset_controller"
application.register("reset", ResetController)
