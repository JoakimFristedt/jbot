import sys, json, logging
from flask import Flask, Response, abort, request, jsonify
from flask_restplus import Resource, Api

app = Flask(__name__)
api = Api(app, version='1.0', title='Jbot',
    description='Jbot life',)

@api.route('/event')
class Event(Resource):
  def post(self):
    app.logger.info(request.json)
    if 'challenge' in request.json:
      return Response(request.json['challenge'], mimetype='text/plain')
