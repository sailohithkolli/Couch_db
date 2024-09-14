#!/usr/bin/env bash

#Add your curl statements here
HOST="http://couchdb:5984"

curl -X PUT $HOST/restaurants

curl -i -X POST "$HOST/restaurants/" -H "Content-Type: application/json" -d '{"_id":"Chick_fil_a", "name":"Chick-fil-a", "food_type":["American"], "phonenumber":"2175462000", "website":"www.chick-fil-a.com"}'

curl -i -X POST "$HOST/restaurants/" -H "Content-Type: application/json" -d '{"_id":"spice_of_india", "name":"Spice of India", "food_type":["Indian"], "phonenumber":"6789255690", "website":"www.spiceofIndia.com"}'

curl -i -X POST "$HOST/restaurants/" -H "Content-Type: application/json" -d '{"_id":"Q_Doba", "name":"QDOBA", "food_type":["Mexican"], "phonenumber":"2176987111", "website":"www.qdoba.com"}'

#DO NOT REMOVE
curl -Ssf -X PUT http://couchdb:5984/restaurants/_design/docs -H "Content-Type: application/json" -d '{"views": {"all": {"map": "function(doc) {emit(doc._id, {rev:doc._rev, name:doc.name, food_type:doc.food_type, phonenumber:doc.phonenumber, website:doc.website})}"}}}'
curl -Ssf -X GET http://couchdb:5984/restaurants/_design/docs/_view/all
