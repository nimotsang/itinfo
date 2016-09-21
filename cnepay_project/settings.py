# -*- coding:utf-8 -*-

import os, platform

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.9/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'cu@@w2lo789&(*dss#a5pcw^psv!-8-5x8-#i%rp0_'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []

# Application definition

INSTALLED_APPS = [
    # 'grappelli.dashboard',
    'grappelli',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'updateOp',
    'portmap',
    'appinfo',
    'ipresource',
    'dbinfo',
    'addressbook',
    'shortcut',
]

MIDDLEWARE_CLASSES = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    # 'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'cnepay_project.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'django.template.context_processors.request',
            ],
        },
    },
]

WSGI_APPLICATION = 'cnepay_project.wsgi.application'

# Database
# https://docs.djangoproject.com/en/1.9/ref/settings/#databases

DATABASES = dict(default={
    'ENGINE': 'django.db.backends.mysql',
    'NAME': 'itinfo',
    'USER': 'root',
    'PASSWORD': '12345678',
    'HOST': '127.0.0.1',
    'PORT': '3306',
    'OPTIONS': {
        'init_command': "SET sql_mode='STRICT_TRANS_TABLES'"
    }
})

# Password validation
# https://docs.djangoproject.com/en/1.9/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

HERE = os.path.dirname(os.path.dirname(__file__))
# 存放上传文件的目录
MEDIA_ROOT = os.path.join(HERE, './uploads/').replace('\\', '/')
# 访问上传文件目录的uri路径
MEDIA_URL = "/uploads/"
# 执行命令python manage.py collectstatic 之后静态文件将要复制到的目录，这个目录只有在运行collectstatic时候才会用到
STATIC_ROOT = os.path.join(HERE, './static/grappelli').replace('\\', '/')
# 静态文件访问路径
STATIC_URL = '/static/'
# 模版中使用的静态文件指向路径
STATICFILES_DIRS = (os.path.join(HERE, './static/').replace('\\', '/'),)
# 调用方式举例
# {% load staticfiles %}
# <img src="{% static "my_app/myexample.jpg" %}" alt="My image"/>


if platform.system() == "Windows":
    # 添加日志功能
    LOGGING = {
        'version': 1,
        'disable_existing_loggers': False,
        'handlers': {
            'file': {
                'level': 'DEBUG',
                'class': 'logging.FileHandler',
                'filename': 'd:/itinfo_debug.log',
            },
        },
        'loggers': {
            'django': {
                'handlers': ['file'],
                'level': 'DEBUG',
                'propagate': True,
            },
        },
    }

elif platform.system() == "Linux":
    # 添加日志功能
    LOGGING = {
        'version': 1,
        'disable_existing_loggers': False,
        'handlers': {
            'file': {
                'level': 'DEBUG',
                'class': 'logging.FileHandler',
                'filename': '/tmp/itinfo_debug.log',
            },
        },
        'loggers': {
            'django': {
                'handlers': ['file'],
                'level': 'DEBUG',
                'propagate': True,
            },
        },
    }


# Internationalization
# https://docs.djangoproject.com/en/1.9/topics/i18n/

LANGUAGE_CODE = 'zh-Hans'
TIME_ZONE = 'Asia/Shanghai'

USE_I18N = True

USE_L10N = True

USE_TZ = True

ADMIN_MEDIA_PREFIX = STATIC_URL + "grappelli/"

GRAPPELLI_ADMIN_TITLE = '中汇支付运维综合管理系统'

GRAPPELLI_INDEX_DASHBOARD = {
    'django.contrib.admin.site': 'cnepay_project.dashboard.CustomIndexDashboard',
}
