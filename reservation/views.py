from django.views import generic
from . import models


class RoomListView(generic.ListView):
    model = models.Room
    template_name = "reservation/index.html"

    def get_queryset(self):
        # 後ほどユーザー種別による表示制御を追加します
        available_rooms = models.Room.objects.all()
        return available_rooms
