---
description: Analyze logic and generate drawio flowchart
argument-hint: [code/file/logic to analyze]
---

# Task: Analyze Logic and Generate Draw.io Flowchart

**IMPORTANT: All output, explanations, and communication MUST be in Chinese (中文). Flowchart labels should also be in Chinese.**

## Drawing Specification

Follow the draw.io diagram generation specification from:
@prompt/drawio/drawio.md

## Your Task

1. **Analyze the logic**: $ARGUMENTS

2. **Understand the flow**:
   - Identify the main process steps
   - Identify decision points (conditions, branches)
   - Identify loops and iterations
   - Identify start and end points
   - Identify data flow and transformations

3. **Generate a professional draw.io flowchart** that:
   - Uses appropriate flowchart shapes (ellipse for start/end, rectangle for process, diamond for decision, etc.)
   - Has clear, descriptive labels for each step
   - Shows the logical flow with properly connected arrows
   - Uses colors to distinguish different types of operations
   - Maintains proper spacing and layout (keep within 800x600 viewport)
   - Follows the XML structure and best practices from the specification

4. **Flowchart Guidelines**:
   - Start with a "Start" node (ellipse shape)
   - End with an "End" node (ellipse shape)
   - Use rectangles for process steps
   - Use diamonds for decision points (with Yes/No branches)
   - Use appropriate colors: green for start, red for end, blue for processes, yellow for decisions
   - Add edge labels for decision branches (Yes/No, True/False, etc.)
   - Keep the layout compact and readable

5. **Save the flowchart**:
   - Save the generated flowchart file to the `.claude` directory in the current project
   - Create the `.claude` directory if it doesn't exist
   - Use a descriptive filename based on the analyzed logic (e.g., `login-flow.drawio`, `payment-process.drawio`)

## Important Notes

- If $ARGUMENTS is a file path, read the file first to understand the logic
- If $ARGUMENTS is code, analyze it directly
- If $ARGUMENTS is a description, create a flowchart based on the description
- Always explain your understanding of the logic before generating the diagram
- Use the display_diagram tool to generate the flowchart (never return raw XML in text)
- Ensure the `.claude` directory exists before saving the file
