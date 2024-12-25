from django.urls import path
from .views import Register, Login, Logout, GetUserData, UpdateProfile

urlpatterns = [
    path("backend/register", Register.as_view()),  # Register new user
    path("backend/login", Login.as_view()),  # Login
    path("backend/logout", Logout.as_view()),  # Logout
    path("backend/user/<str:username>", GetUserData.as_view()),  # Get user data
    path("backend/updateprofile/<str:username>", UpdateProfile.as_view()),  # Update profile
]
