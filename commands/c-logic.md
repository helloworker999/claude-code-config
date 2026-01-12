---
description: Analyze interface logic and generate documentation
argument-hint: [interface/API endpoint to analyze]
---

# Task: Analyze Interface Logic and Generate Documentation

**IMPORTANT: All output, documentation, and communication MUST be in Chinese (中文).**

## Your Task

1. **Analyze the interface**: $ARGUMENTS

2. **Understand the implementation**:
   - Identify the interface/API endpoint definition
   - Trace the complete logic flow from entry point to response
   - Identify all dependencies (services, models, utilities)
   - Document request/response structures
   - Identify error handling and edge cases
   - Note any business logic, validations, or transformations
   - Identify database queries and external API calls

3. **Generate comprehensive documentation** that includes:
   - **Overview**: Brief description of what the interface does
   - **Request Structure**: Parameters, body, headers
   - **Response Structure**: Success and error responses
   - **Logic Flow**: Step-by-step breakdown of the implementation
   - **Dependencies**: List of services, models, and utilities used
   - **Database Operations**: Queries, transactions, and data modifications
   - **External Integrations**: Third-party APIs or services called
   - **Error Handling**: Possible errors and how they're handled
   - **Business Rules**: Validation rules and business logic
   - **Code References**: File paths and line numbers for key components

4. **Documentation Format**:
   - Use clear markdown formatting
   - Include code snippets where relevant
   - Use bullet points and numbered lists for clarity
   - Add diagrams or flowcharts if helpful
   - Reference specific files and line numbers (e.g., `file.ts:123`)

5. **Save the documentation**:
   - Determine the current project name from the git repository or directory name
   - Create the directory structure: `~/studio/code/claude-doc/[project-name]/`
   - Save the documentation with a descriptive filename based on the interface name
   - Example: `~/studio/code/claude-doc/my-project/user-login-api.md`

## Important Notes

- If $ARGUMENTS is a file path, read the file and analyze the interface
- If $ARGUMENTS is an interface/endpoint name, search for it in the codebase
- Always trace the complete logic flow, not just the entry point
- Include practical examples where helpful
- Document any security considerations or authentication requirements
- Note any performance considerations or optimization opportunities
- Create the documentation directory if it doesn't exist

## Analysis Steps

1. **Find the interface**: Search for the interface/endpoint in the codebase
2. **Read the implementation**: Read all relevant files
3. **Trace dependencies**: Follow imports and function calls
4. **Document findings**: Create structured documentation
5. **Save to project directory**: Store in ~/studio/code/claude-doc/[project-name]/
