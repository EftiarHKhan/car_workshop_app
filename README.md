# Assignment of Ichiban Auto Limited (Car Workshop Mobile App)

## Overview
his is a mobile application for managing a car workshop, developed using Flutter as part of a task for a job interview at Ichiban Auto Limited. The app supports role-based access for Admins and Mechanics, allowing them to manage bookings effectively. The project includes:

* Role-Based Authentication:
1. Login and registration based on user roles (Admin & Mechanic).
2. Role selection during the registration process.

* Admin Functionalities:
1. Create new bookings.
2. View the complete list of bookings.
3. Filter bookings based on dates.
4. View detailed information about each booking.
   
* Mechanic Functionalities:
1. View the list of bookings assigned to them.
2. Access booking details only if the booking is assigned to them.
3. Booking Details
   
* The booking details screen displays:
1. Booking title, start date, and end date.
2. Car information (make, model, year, registration plate).
3. Customer details (name, email, phone number).
4. Assigned mechanic information.
   
##Technology Stack
1. Frontend: Flutter (Dart)
2. Backend: Firebase Api Service


## How to run the project
simply clone the project and run "flutter pub get" in the terminal on the root project directory then run the project from the terminal by running the command "flutter run lib/main_dev.dart or flutter run lib/main_prod.dart"

## Project Structure
The project follows a modular structure, and key components are organized as follows:

```bash
├── app
│   ├── bindings
│   │   └── initial_binding.dart
│   ├── core
│   │   ├── base
│   │   │   ├── base_controller.dart
│   │   │   ├── base_view.dart
│   │   │   ├── base_widget_mixin.dart
│   │   │   ├── mixins
│   │   │   │   ├── shorter_enum_mixin.dart
│   │   │   │   └── validator_mixin.dart
│   │   │   └── paging_controller.dart
│   │   ├── core_model
│   │   │   ├── page_state.dart
│   │   │   └── page_status.dart
│   │   ├── loaders
│   │   │   ├── color_loader_2.dart
│   │   │   ├── color_loader_5.dart
│   │   │   ├── loader_screen.dart
│   │   │   └── theme_loader.dart
│   │   ├── utils
│   │   │   └── debouncer.dart
│   │   ├── values
│   │   │   ├── app_colors.dart
│   │   │   ├── app_values.dart
│   │   │   ├── asset_values.dart
│   │   │   ├── custom_functions.dart
│   │   │   └── text_styles.dart
│   │   └── widget
│   │       ├── app_bar_title.dart
│   │       ├── asset_image_view.dart
│   │       ├── button_component.dart
│   │       ├── custom_app_bar.dart
│   │       ├── dialog_pattern.dart
│   │       ├── elevated_container.dart
│   │       ├── expandable_text_widget.dart
│   │       ├── icon_text_widgets.dart
│   │       ├── input_field_one.dart
│   │       ├── loading.dart
│   │       ├── network_image_widget.dart
│   │       ├── paging_view.dart
│   │       ├── ripple.dart
│   │       ├── text_form_field_widget.dart
│   │       └── text_widget.dart
│   ├── model
│   │   └── booking_details.dart
│   ├── my_app.dart
│   ├── pages
│   │   ├── app_root
│   │   │   ├── bindings
│   │   │   │   └── app_root_binding.dart
│   │   │   ├── controllers
│   │   │   │   └── app_root_controller.dart
│   │   │   ├── model
│   │   │   │   └── navbar_items.dart
│   │   │   └── views
│   │   │       └── app_root_view.dart
│   │   ├── booking_details
│   │   │   ├── bindings
│   │   │   │   └── booking_details_binding.dart
│   │   │   ├── controllers
│   │   │   │   └── booking_details_controller.dart
│   │   │   └── views
│   │   │       └── booking_details_view.dart
│   │   ├── bookings_list
│   │   │   ├── bindings
│   │   │   │   └── bookings_list_binding.dart
│   │   │   ├── controllers
│   │   │   │   └── bookings_list_controller.dart
│   │   │   └── views
│   │   │       └── bookings_list_view.dart
│   │   ├── create_booking
│   │   │   ├── bindings
│   │   │   │   └── create_booking_binding.dart
│   │   │   ├── controllers
│   │   │   │   └── create_booking_controller.dart
│   │   │   └── views
│   │   │       └── create_booking_view.dart
│   │   ├── home
│   │   │   ├── bindings
│   │   │   │   └── home_binding.dart
│   │   │   ├── controllers
│   │   │   │   └── home_controller.dart
│   │   │   └── views
│   │   │       └── home_view.dart
│   │   ├── intro
│   │   │   ├── login
│   │   │   │   ├── bindings
│   │   │   │   │   └── login_binding.dart
│   │   │   │   ├── controllers
│   │   │   │   │   └── login_controller.dart
│   │   │   │   └── views
│   │   │   │       └── login_view.dart
│   │   │   └── registration
│   │   │       ├── bindings
│   │   │       │   └── registration_binding.dart
│   │   │       ├── controllers
│   │   │       │   └── registration_controller.dart
│   │   │       └── views
│   │   │           └── registration_view.dart
│   │   ├── profile
│   │   │   ├── bindings
│   │   │   │   └── profile_binding.dart
│   │   │   ├── controllers
│   │   │   │   └── profile_controller.dart
│   │   │   └── views
│   │   │       └── profile_view.dart
│   │   └── splash
│   │       ├── bindings
│   │       │   └── splash_binding.dart
│   │       ├── controllers
│   │       │   └── splash_controller.dart
│   │       └── views
│   │           └── splash_view.dart
│   ├── routes
│   │   ├── app_pages.dart
│   │   └── app_routes.dart
│   ├── service
│   │   ├── client
│   │   │   ├── api_options.dart
│   │   │   ├── error_catcher.dart
│   │   │   ├── network_error_widgets
│   │   │   │   ├── error_screen.dart
│   │   │   │   ├── no_internet_screen.dart
│   │   │   │   ├── not_found_screen.dart
│   │   │   │   ├── time_out_screen.dart
│   │   │   │   └── unmatched_data_type_screen.dart
│   │   │   ├── rest_client.dart
│   │   │   └── utils
│   │   │       ├── exception_message.dart
│   │   │       ├── failures.dart
│   │   │       └── pretty_dio_logger.dart
│   │   ├── endpoints.dart
│   │   └── services.dart
│   └── session_manager
│       ├── prefs_keys.dart
│       └── session_manager.dart
├── firebase_options.dart
├── flavors
│   ├── build_config.dart
│   ├── env_config.dart
│   └── environment.dart
├── l10n
│   ├── app_bn.arb
│   └── app_en.arb
├── main_dev.dart
└── main_prod.dart
```

## State Management
This project uses GetX for state management. The relevant files are located in the lib/app/core/base directory:

- `base_controller.dart`: Controller for managing the state of the pages
- `base_remote_source.dart`: Remote source for fetching data from the API
- `base_view.dart`: Base view for the pages
- `base_widget_mixin.dart`: Mixin for common widgets
- `mixins`: Contains different mixins for the project
- `paging_controller.dart`: Controller for managing the state of the paging view
- `model`: Contains the page state and page status models
- `pages`: Contains the different pages of the project
- `utils`: Contains utility modules and helper functions used across the app
- `values`: Contains the app colors, values, and text styles
- `widget`: Contains commonly used widgets across the app
- `data`: Contains the local and remote data sources
- `global_modals`: Contains the global modals used in the app
- `model`: Contains the models used in the app

## Libraries Used
- `get`: State management library for Flutter with a focus on simplicity and performance.
- `nb_utils`: A package for common utility methods and widgets.

## Screenshots

<table>
  <tr>
    <td>1. Splash Screen</td>
     <td>2. Login Screen (Role based)</td>
     <td>3. Registration Screen (Role based)</td>
  </tr>
  <tr>
    <td><img src="![Screenshot_20241022-154400](https://github.com/user-attachments/assets/b535882d-c471-443b-8dcc-7441b305448f)" width=270 height=480></td>
    <td><img src="![Screenshot_20241022-154408](https://github.com/user-attachments/assets/8626ecd4-9a0c-40a6-a654-e347fb569de2)" width=270 height=480></td>
    <td><img src="![Screenshot_20241022-154414](https://github.com/user-attachments/assets/6c16b72d-41b5-4e9b-aa41-eb3ee5a7aec0)" width=270 height=480></td>
  </tr>
 </table>

1. Splash Screen
   ![Screenshot_20241022-154400](https://github.com/user-attachments/assets/b535882d-c471-443b-8dcc-7441b305448f)

2. Login Screen (Role based)
   ![Screenshot_20241022-154408](https://github.com/user-attachments/assets/8626ecd4-9a0c-40a6-a654-e347fb569de2)

3. Registration Screen (Role based)
   ![Screenshot_20241022-154414](https://github.com/user-attachments/assets/6c16b72d-41b5-4e9b-aa41-eb3ee5a7aec0)

4. Booking List View (Role based)
   ![Screenshot_20241022-154452](https://github.com/user-attachments/assets/8f536f3b-b622-4a3d-be8c-3feba0c83b2c)

5. Calendar View of Booking List
   ![Screenshot_20241022-154509](https://github.com/user-attachments/assets/ff6dc510-a8e0-461a-8ffa-bc9aed1168e2)

6. Booking Details Screen
   ![Screenshot_20241022-154539](https://github.com/user-attachments/assets/42a3ab26-c474-4278-8eaa-3b7bcdf9c1c1)

7. Create Booking by Admin
   ![Screenshot_20241022-154523](https://github.com/user-attachments/assets/198b6f83-f68c-4659-972a-c5af9f5218f6)
   ![Screenshot_20241022-154529](https://github.com/user-attachments/assets/b7ae1921-b476-46a7-bbd2-442c6f02b70c)



## Video preview



## Apk for Android



## Thank you for review


