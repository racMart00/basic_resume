'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "29f46d8b2d11f3c3705077691aadaf63",
"assets/AssetManifest.bin.json": "19f7e9d0f78e0ee763ca5ac60d8234bd",
"assets/AssetManifest.json": "8ac9465e24e4733ac0809e54caab0df6",
"assets/assets/db/projects.json": "ef72e14e7f3ba630fa6a05af1098fe96",
"assets/assets/db/sections.json": "b91e31431ad41a46d5ad8f0a47898876",
"assets/assets/icons/dev_icons/bootstrap.svg": "8c2689b779cee6d34f5bd5fc13201fee",
"assets/assets/icons/dev_icons/css.svg": "226fad1b7e4d46b173db2c1a3e2d6a19",
"assets/assets/icons/dev_icons/django.svg": "44cf15d33da5350d1e07fae950800c80",
"assets/assets/icons/dev_icons/flutter.svg": "07464be0b995a9f8370688fbd7508c58",
"assets/assets/icons/dev_icons/godot.svg": "0bf4566b410ae42415f1bc9e0b424e02",
"assets/assets/icons/dev_icons/html.svg": "0d0ac1028d0952473a96397390475a64",
"assets/assets/icons/dev_icons/java.svg": "b93668739240c6a3a40ee9ac240fb2be",
"assets/assets/icons/dev_icons/js.svg": "0bcc57b0ee784adb5bd554ef0548505b",
"assets/assets/icons/dev_icons/postgresql.svg": "9e764d07f1240bee5d1e570b3664c73d",
"assets/assets/icons/dev_icons/python.svg": "e9065b5915bb2ffed70f6463ed10e69e",
"assets/assets/icons/dev_icons/react.svg": "8ed4fcfa4b9f0b2b85a00eda3d6f1825",
"assets/assets/icons/dev_icons/roblox.svg": "c5e0a673df1f1a4737bbedd2f7a3d598",
"assets/assets/icons/dev_icons/tailwind.svg": "0a94ca4cd8a9a945fb1ec48d1428aa8f",
"assets/assets/icons/download.svg": "a72b0fff9ddb18ffd36ff915ec11a1bc",
"assets/assets/icons/racmart_logo_512px.png": "bfb4611b066b9ed9c19881771175829e",
"assets/assets/icons/racmart_logo_hd.jpg": "04a284148a087fe13256d17fec71d965",
"assets/assets/icons/social_media/github.png": "2dc32ed64c29cc81810431e55f9df5b5",
"assets/assets/icons/social_media/linkedin.png": "780a3517324e1ee68a127b26ff78eadf",
"assets/assets/images/avatar.png": "441a1a61c03abeb192f4c7e81281a676",
"assets/assets/images/banner.png": "15332132f87905b6754521810a374138",
"assets/assets/images/projects_banners/dont_die.png": "967bd3dd9c7aa7fd6e3f558706d13f25",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "d8cca7602ddd53b775dc0cd1f276f46c",
"assets/NOTICES": "4a4ce4d11add90b75d6aa33bfcd59dcd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "e7035c7522f41ac642718a6b31bc2eac",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "833016a077d3933f8ba752b3bc4dc504",
"icons/Icon-192.png": "d82637a762200d45ffda431387cbb8bd",
"icons/Icon-512.png": "a4b7a7425e749d2202fcd6ee7e530e09",
"icons/Icon-maskable-192.png": "d82637a762200d45ffda431387cbb8bd",
"icons/Icon-maskable-512.png": "a4b7a7425e749d2202fcd6ee7e530e09",
"index.html": "851c21aaa91e68a9a40704027d29a508",
"/": "851c21aaa91e68a9a40704027d29a508",
"main.dart.js": "7fd87dd3e7dabd34d196bdd3831e8740",
"manifest.json": "314b379b2dbb43ff6af7258a5588180c",
"version.json": "88d43f44c5c4262d05d7c8a3476a4893"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
