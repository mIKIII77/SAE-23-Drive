from http import client
from click import command
from django.http import HttpResponse
from django.shortcuts import get_object_or_404, redirect, render
from drive.models import *
from drive.forms import *


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
    commande, created = Commande.objects.get_or_create(client=user, Produit=produit, ordered=False)

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

def commander_panier(request):
    if panier := request.user.panier:
        panier.commander()
    return redirect(reverse("allproduits"))


def delete_panier(request):
    if panier := request.user.panier:
        panier.commandes.all().delete()
    return redirect(reverse("allproduits"))

def delete_commande_panier(request, pk):
    if panier := request.user.panier:
        commande = panier.commandes.get(id=pk)
        commande.delete()
    return redirect(reverse("panier"))

def all_commandes_ordered_by_user(request):
    commandes = Commande.objects.filter(client=request.user, ordered=True)
    return render(request, 'drive/all_commandes_ordered_by_user.html', context={'commandes': commandes})

def add_catprod(request):
    submitted = False
    if request.method == 'POST':
        form = CatprodForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('all_catprod')
    else:
        form = CatprodForm
        if 'submitted' in request.GET:
            submitted = True
    return render(request, 'drive/add_catprod.html', {'form': form, 'submitted': submitted})

def add_produit(request):
    submitted = False
    if request.method == 'POST':
        form = ProduitForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('allproduits')
    else:
        form = ProduitForm
        if 'submitted' in request.GET:
            submitted = True
    return render(request, 'drive/add_produit.html', {'form': form, 'submitted': submitted})


def all_catprod(request):
    catprods = Catprod.objects.all()
    return render(request, 'drive/all_catprod.html', {'catprods': catprods})

def catprod_detail(request, catprod_id):
    catprod = get_object_or_404(Catprod, pk=catprod_id)
    return render(request, 'drive/catprod_detail.html', {'catprod': catprod})

