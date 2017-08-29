#!/bin/bash

ipmitool -I lanplus -U root -H $1 sol activate
