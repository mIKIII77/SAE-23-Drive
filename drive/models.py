from django.db import models
from rtshop.settings import AUTH_USER_MODEL
# Create your models here.

class Catprod(models.Model):
    nom = models.CharField(max_length=255)
    descriptif = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.nom


class Produit(models.Model):
    nom = models.CharField(max_length=255)
    dateper = models.DateField()
    photo = models.ImageField(upload_to='photosprod')
    marque = models.CharField(max_length=255)
    cat = models.ForeignKey(Catprod, models.DO_NOTHING, db_column='cat')
    prix = models.FloatField(default=0.0)
    stock = models.IntegerField(default=0)

    def __str__(self):
        return self.nom

class Commande(models.Model):
    client = models.ForeignKey(AUTH_USER_MODEL, on_delete=models.CASCADE)
    Produit = models.ForeignKey(Produit, on_delete=models.CASCADE)
    date = models.DateField()
    quantite = models.IntegerField(default=1)
    ordered = models.BooleanField(default=False)
    datecommande = models.DateTimeField(blank=True, null=True)

    def __str__(self):
        return f"{self.Produit.nom} - {self.quantite}"

class Panier(models.Model):
    client = models.OneToOneField(AUTH_USER_MODEL, on_delete=models.CASCADE)
    commandes = models.ManyToManyField(Commande, blank=True)
    total = models.FloatField(default=0.0)
    def __str__(self):
        return f"{self.client.username}"
