# Generated by Django 3.2.12 on 2022-06-17 10:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('drive', '0007_alter_produit_photo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='produit',
            name='photo',
            field=models.ImageField(upload_to='photosprod'),
        ),
    ]
