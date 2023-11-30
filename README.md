# COVID-19 Contact Tracing Database

## Introduction
This repository contains the implementation of a COVID-19 Contact Tracing Database, aiming to facilitate tracking and management of individuals potentially affected by the COVID-19 virus. The database incorporates the use of GPS coordinates, test results, user information, and notifications to monitor and alert users about potential exposure or infection risks.

## Overview
The project aims to:
- Track individuals coming in contact with infected persons using GPS location data.
- Maintain records of tests conducted in various labs.
- Notify users and health officials about potential infection risks.
- Determine infection statuses, immunity levels, and travel histories.

## Database Design
### Conceptual Model
- Describes entities and their relationships for the Contact Tracing Database.
### Logical Model
- Specifies attributes, primary and foreign keys, and cardinalities between entities.
### Relational Schema
- Details tables, columns, and constraints for the database.

## Implementation Details
- Followed a Top-Down Design Approach for the database design.
- Utilized BigQuery as the Database Management System due to its scalability and analytical capabilities.

## Testing & Evaluation
- Conducted CRUD operations (Create, Retrieve, Update, Delete) to test database functionality.
- Executed custom queries to fulfill defined project objectives.

## Views and Procedures
- Created a view to display user test information and a stored procedure to retrieve infected cases for a specific state.

## Conclusion
The COVID-19 Contact Tracing Database offers a structured system to aid in disease control and monitoring. The database design, implementation, and testing demonstrate its potential effectiveness in automating the contact tracing process.

## Future Work
- Expand the database for generic contact tracing purposes and for broader analytical applications.
- Consider integrating user surveys for symptom updates to enhance disease tracking capabilities.

## Acknowledgments
- Contributors: [Shwetarani, Samhitha Upadhyaya, Mohini Patil]


For more detailed information, refer to the project documentation and source code files.
