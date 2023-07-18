#!/usr/bin/env python3
""" Task 8. List all documents in Python """


def list_all(mongo_collection):
    """ lists all documents in a collection """
    if not mongo_collection:
        return []
    return mongo_collection.find()
