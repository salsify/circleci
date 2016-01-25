CircleCI = require "../../src/circleci"

describe "getTestMetadata", ->

  before ->
    @circleci = new CircleCI { auth: process.env.CIRCLE_TOKEN }
    @config = { username: "jpstevens", project: "circleci", build_num: "10" }

  it "returns an array of the test metadata for a given build", (done) ->

    @circleci.getTestMetadata(@config).then (res) ->
      expect(res).to.be.ok
      expect(res).to.be.instanceof Array
      expect(res.length).to.equal 5
      done()