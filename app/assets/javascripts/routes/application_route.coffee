App.Router.map ->
  @resource "home", path: '/'
  @resource "posts", ->
    @route "new"
    @route "edit",
      path: "/:post_id/edit"
    @route "show",
      path: "/:post_id"
  @resource "videos", ->
    @route "new"
    @route "edit",
      path: "/:video_id/edit"
    @route "show",
      path: "/:video_id"
  @resource "books", ->
    @route "new"
    @route "edit",
      path: "/:book_id/edit"
    @route "show",
      path: "/:book_id"
  @resource "lessons", ->
    @route "new"
    @route "_snip"
    @route "edit",
      path: "/:lesson_id/edit"
    @route "show",
      path: "/:lesson_id"
  @resource "happenings", ->
    @route "new"
    @route "edit",
      path: "/:happening_id/edit"
    @route "show",
      path: "/:happening_id"
  @resource "contacts", ->
    @route "new"
    @route "edit",
      path: "/:contact_id/edit"
    @route "show",
      path: "/:contact_id"

App.HomeRoute = Em.Route.extend
  model: ->
    App.Lesson.find()

App.PlayerRoute = Em.Route.extend
  model: ->
    App.Lesson.find()

App.ApplicationRoute = Em.Route.extend
  model: ->
    App.Lesson.find()

