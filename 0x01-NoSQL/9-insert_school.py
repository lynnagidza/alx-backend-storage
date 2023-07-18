#!/usr/bin/env python3
""" Task 9. Insert a document in Python """


def insert_school(mongo_collection, **kwargs):
    """ inserts a new document in a collection based on kwargs """
    if not mongo_collection:
        return None
    return mongo_collection.insert_one(kwargs).inserted_id
