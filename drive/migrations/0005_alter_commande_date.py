# Generated by Django 3.2.12 on 2022-06-13 13:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('drive', '0004_produit_slug'),
    ]

    operations = [
        migrations.AlterField(
            model_name='commande',
            name='date',
            field=models.DateField(blank=True, null=True),
        ),
    ]
