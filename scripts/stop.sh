#!/bin/bash
docker stop aws-cicd-app || true
docker rm aws-cicd-app || true
