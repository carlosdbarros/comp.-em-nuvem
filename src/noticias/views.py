from django.views.generic.list import ListView

from noticias.models import Noticia


class NoticiaListView(ListView):
    model = Noticia
    template_name = "listar.html"
