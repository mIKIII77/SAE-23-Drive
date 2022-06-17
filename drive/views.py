from cgitb import text
from http import client
from this import d
from click import command
from django.http import HttpResponse, FileResponse
import io
from django.shortcuts import get_object_or_404, redirect, render
from drive.models import *
from drive.forms import *
from reportlab.pdfgen import canvas
from reportlab.lib.units import inch
from reportlab.lib.pagesizes import letter

def home(request):
    return render(request, 'drive/home.html')

def allproduits(request):
    produits = Produit.objects.all()
    return render(request, 'drive/allproduits.html', {'produits': produits})

def all_produits_admin(request):
    produits = Produit.objects.all()
    return render(request, 'drive/all_produit_admin.html', {'produits': produits})

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
        form = ProduitForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('all_produits_admin')
    else:
        form = ProduitForm
        if 'submitted' in request.GET:
            submitted = True
    return render(request, 'drive/add_produit.html', {'form': form, 'submitted': submitted})

def delete_produit(request, produit_id):
    produit = get_object_or_404(Produit, pk=produit_id)
    produit.delete()
    return redirect('all_produits_admin')

def update_produit(request, produit_id):
    produit = get_object_or_404(Produit, pk=produit_id)
    if request.method == 'POST':
        form = ProduitForm(request.POST, instance=produit)
        if form.is_valid():
            form.save()
            return redirect('all_produits_admin')
    else:
        form = ProduitForm(instance=produit)
    return render(request, 'drive/update_produit.html', {'form': form})

def all_catprod(request):
    catprods = Catprod.objects.all()
    return render(request, 'drive/all_catprod.html', {'catprods': catprods})

def catprod_detail(request, catprod_id):
    catprod = get_object_or_404(Catprod, pk=catprod_id)
    return render(request, 'drive/catprod_detail.html', {'catprod': catprod})

def catprod_delete(request, catprod_id):
    catprod = get_object_or_404(Catprod, pk=catprod_id)
    catprod.delete()
    return redirect('all_catprod')

def catprod_update(request, catprod_id):
    catprod = get_object_or_404(Catprod, pk=catprod_id)
    if request.method == 'POST':
        form = CatprodForm(request.POST, instance=catprod)
        if form.is_valid():
            form.save()
            return redirect('all_catprod')
    else:
        form = CatprodForm(instance=catprod)
    return render(request, 'drive/catprod_update.html', {'form': form})

def commandes_pdf(request):
    buf = io.BytesIO()
    c = canvas.Canvas(buf, pagesize=letter, bottomup=0)
    textob = c.beginText()
    textob.setTextOrigin(inch, inch)
    textob.setFont("Helvetica", 12)

    commandes = Commande.objects.filter(client=request.user, ordered=True)

    lines = [
        "Voici vos commandes :",
    ]

    for commande in commandes:
        lines.append(f"")
        lines.append(f"Vous avez commandé : {commande.Produit.nom} de la marque {commande.Produit.marque} en quantité de : {commande.quantite}.)")
        lines.append(f"Prix unité de ce produit : {commande.Produit.prix}€.")
        lines.append(f"Vous avez payé em totale pour ce(s) produits :{commande.Produit.prix * commande.quantite}€.")
        lines.append(f"Ce(s) produits ont été commandés le : {commande.datecommande}.")
        lines.append(f"----------------------------------------")

    for line in lines:
        textob.textLine(line)
 
    

    c.drawText(textob)
    c.showPage()
    c.save()
    buf.seek(0)

    return FileResponse(buf, as_attachment=True, filename='commandes.pdf')