from click import command
from django.http import HttpResponse
from django.shortcuts import get_object_or_404, redirect, render
from drive.models import *


def home(request):
    return render(request, 'drive/home.html')

def allproduits(request):
    produits = Produit.objects.all()
    return render(request, 'drive/allproduits.html', {'produits': produits})

def produit_detail(request, slug):
    produit = get_object_or_404(Produit, slug=slug)
    return render(request, 'drive/produit_detail.html', {'produit': produit})

def add_to_cart(request, slug):
    user = request.user
    produit = get_object_or_404(Produit, slug=slug)
    panier, _ = Panier.objects.get_or_create(client=user)
    commande, created = Commande.objects.get_or_create(client=user, Produit=produit)

    if created:
        panier.commandes.add(commande)
        panier.save()
    else:
        commande.quantite += 1
        commande.save()
    
    return redirect(reverse("produit", kwargs={"slug": slug}))


def panier(request):
    panier = get_object_or_404(Panier, client=request.user)
    return render(request, 'drive/panier.html', context={'commandes': panier.commandes.all()})
