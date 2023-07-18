#!/usr/bin/env python3
""" Task 12. Log stats """


def log_stats(mongo_collection, option=None):
    """ provides some stats about Nginx logs stored in MongoDB """
    if not mongo_collection:
        return 0
    if option is None:
        return mongo_collection.count_documents({})
    return mongo_collection.count_documents({"method": option})
