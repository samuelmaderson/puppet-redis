#!/usr/bin/env python3

import os


class redis:

    def __init__(self, dir):

        if(os.path.exists(dir)):

            obj = {"rediscomp": "ok"}
            for k in obj:
                print(k+'='+obj[k])


        else:

            obj = {"rediscomp": "err"}
            for k in obj:
                print(k+'='+obj[k])


redis('/opt/redis-stable')
