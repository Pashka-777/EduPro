from rest_framework.routers import DefaultRouter
from .views import CategoryViewSet, CourseViewSet, LessonViewSet

router = DefaultRouter()
router.register('categories', CategoryViewSet)
router.register('courses', CourseViewSet)
router.register('lessons', LessonViewSet)

urlpatterns = router.urls
