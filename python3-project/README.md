# Weather Forecast Web Application

## Introduction

This project is a web-based weather forecasting tool that provides users with temperature details, humidity levels, and the ability to download images of the sky. Users can input a city or country to retrieve weather data, view their search history, and have the option to store their searches in DynamoDB.

## Table of Contents

- [Features](#features)
- [Dependencies](#dependencies)
- [Documentation](#documentation)


## Features

- Weather forecasts by city or country.
- Historical search data view.
- API for downloading sky images.
- Integration with DynamoDB for storing search details.

## Dependencies

- Bootstrap (for styling)
- Flask (Python web framework)
- Boto3 (for AWS DynamoDB interaction)
- python3
- python3-pip
- gunicorn


## Documentation

The main HTML endpoints are:

- `/` - The homepage where the user can input their search.
- `/history` - Displays the user's search history.
- `/download` - Endpoint for downloading sky images.
- `/dynamoDB` - Endpoint for sending details to DynamoDB.
