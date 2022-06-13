from django.urls import path
from . import views
from .views import *
from rtshop import settings
from django.conf.urls.static import static


urlpatterns = [
    path('home', views.home, name='home'), # home page
    path('allproduits/', views.allproduits, name='allproduits'), # allproduits/
    path('produit/<str:slug>/', produit_detail, name='produit'), # <str:slug> is a variable
    path('produit/<str:slug>/add-to-cart/', add_to_cart, name='add_to_cart'), # add to cart
    path('panier/', Panier, name='panier'), # cart
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) # static files