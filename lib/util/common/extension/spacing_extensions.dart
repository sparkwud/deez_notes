import 'package:flutter/material.dart';

extension SpacingExtension on num {
  // Method to return a SizedBox with vertical or horizontal spacing
  Widget get spacing {
    return Builder(
      builder: (BuildContext context) {
        final axis = context.parentAxis;
        if (axis == Axis.horizontal) {
          return SizedBox(width: toDouble());
        } else {
          return SizedBox(height: toDouble());
        }
      },
    );
  }
}

extension DoubleExtensions on double {
  Widget get sbH => SizedBox(height: this);

  Widget get sbW => SizedBox(width: this);

  EdgeInsetsGeometry get padA => EdgeInsets.all(this);

  EdgeInsetsGeometry get padV => EdgeInsets.symmetric(vertical: this);

  EdgeInsetsGeometry get padH => EdgeInsets.symmetric(horizontal: this);
}

extension BuildContextExtension on BuildContext {
  // Helper method to determine the axis of the parent widget
  Axis get parentAxis {
    if (findAncestorWidgetOfExactType<Row>() != null) {
      return Axis.horizontal;
    } else if (findAncestorWidgetOfExactType<Column>() != null) {
      return Axis.vertical;
    } else {
      // Default to vertical if the parent is neither Row nor Column
      return Axis.vertical;
    }
  }
}

// // Spacing extensions
// extension SpacingExtension on num {
//   // Method to return a SizedBox with vertical or horizontal spacing
//   Widget spacing(BuildContext context) {
//     // Determine the axis based on the parent widget
//     final axis = _getParentAxis(context);
//     if (axis == Axis.horizontal) {
//       return SizedBox(width: toDouble());
//     } else {
//       return SizedBox(height: toDouble());
//     }
//   }

//   // Helper method to determine the axis of the parent widget
//   Axis _getParentAxis(BuildContext context) {
//     // Check if the parent widget is a Row or Column
//     if (context.findAncestorWidgetOfExactType<Row>() != null) {
//       return Axis.horizontal;
//     } else if (context.findAncestorWidgetOfExactType<Column>() != null) {
//       return Axis.vertical;
//     } else {
//       // Default to vertical if the parent is neither Row nor Column
//       return Axis.vertical;
//     }
//   }
// }


// extension SpacingExtension on num {
//   // Method to return a SizedBox with vertical or horizontal spacing
//   Widget spacing({required BuildContext context, required Axis axis}) {
//     if (axis == Axis.horizontal) {
//       return SizedBox(width: toDouble());
//     } else {
//       return SizedBox(height: toDouble());
//     }
//   }
// }

// // Helper widget to determine the axis of the parent widget
// class AxisDetector extends StatelessWidget {
//   final Widget child;

//   const AxisDetector({Key? key, required this.child}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Builder(
//       builder: (BuildContext context) {
//         // Determine the axis based on the parent widget
//         Axis axis = Axis.vertical;
//         if (context.findAncestorWidgetOfExactType<Row>() != null) {
//           axis = Axis.horizontal;
//         } else if (context.findAncestorWidgetOfExactType<Column>() != null) {
//           axis = Axis.vertical;
//         }

//         // Use the determined axis in the provided child widget
//         return child.spacing(context: context, axis: axis);
//       },
//     );
//   }
// }

// // Extension on Widget to make it easier to use
// extension SpacingWidgetExtension on Widget {
//   Widget withSpacing(num spacing) {
//     return AxisDetector(
//       child: spacing.spacing(context: this as BuildContext, axis: Axis.vertical),
//     );
//   }
// }
