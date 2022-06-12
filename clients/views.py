from django.shortcuts import redirect, render
from django.contrib.auth import get_user_model, login, logout, authenticate

User = get_user_model()

def signup(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = User.objects.create_user(username=username, password=password)
        login (request, user)
        return redirect ('home')

    return render(request, 'signup.html')

def logoutuser(request):
    logout(request)
    return redirect('home')

def loginuser(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        login(request, user)
        return redirect('home')
    else:
        return render(request, 'login.html', {'error': 'username or password is incorrect'})