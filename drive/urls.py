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
    path('panier/', panier, name='panier'), # cart
    path('panier/commander/', commander_panier, name='commander_panier'), # order
    path('panier/delete/', delete_panier, name='delete_panier'), # delete cart
    path('panier/delete-commande/<int:pk>/', delete_commande_panier, name='delete_commande_panier'), # delete commande
    path('all_commandes_ordered_by_user/', all_commandes_ordered_by_user, name='all_commandes_ordered_by_user'), # all commandes ordered by user
    path('add_catprod/', add_catprod, name='add_catprod'), # add category of product
    path('add_produit/', add_produit, name='add_produit'), # add product
    path('all_catprod/', all_catprod, name='all_catprod'), # all category of product
    path('catprod_detail/<catprod_id>', catprod_detail, name='catprod_detail'), # category of product detail
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) # static files
