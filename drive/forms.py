from django import forms
from django.forms import ModelForm
from . import models
from django import forms
from .models import *

class CatprodForm(ModelForm):
    class Meta:
        model = Catprod
        labels = {"nom": "Nom de la catégorie", "descriptif": "Description de la catégorie"}
        fields = ["nom", "descriptif"]

        widgets = {
            'nom': forms.TextInput(attrs={'class': 'form-control'}),
            'descriptif': forms.Textarea(attrs={'class': 'form-control'}),
        }

    

class ProduitForm(ModelForm):
    class Meta:
        model = Produit
        labels = {"nom": "Nom du produit", "dateper": "Date de péremption", "photo": "Photo du produit", "slug": "Slug du produit", "marque": "Marque du produit", "cat": "Catégorie du produit", "prix": "Prix du produit", "stock": "Stock du produit"}
        fields = ["nom", "dateper", "photo", "slug", "marque", "cat", "prix", "stock"]

        widgets = {
            'nom': forms.TextInput(attrs={'class': 'form-control'}),
            'dateper': forms.DateInput(attrs={'class': 'form-control'}),
            'photo': forms.FileInput(attrs={'class': 'form-control'}),
            'slug': forms.TextInput(attrs={'class': 'form-control'}),
            'marque': forms.TextInput(attrs={'class': 'form-control'}),
            'cat': forms.Select(attrs={'class': 'form-control'}),
            'prix': forms.NumberInput(attrs={'class': 'form-control'}),
            'stock': forms.NumberInput(attrs={'class': 'form-control'}),
        }
    
    def clean_photo(self):
        photo = self.cleaned_data['photo']
        if photo.content_type not in ['image/jpeg', 'image/png', 'image/jpg']:
            raise forms.ValidationError("Photo non valide")
        return photo
