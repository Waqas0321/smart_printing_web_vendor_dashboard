'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "fd1816a63c25019c58d659ef9e981c5e",
"assets/AssetManifest.bin.json": "5e08defbcce320f4b82aedf9d70b57d9",
"assets/AssetManifest.json": "dc13fb80f0290b8f8ce7cf9ac1284615",
"assets/assets/icons/3%2520User.svg": "2489845f58fbf6978c584ca57599fc14",
"assets/assets/icons/addOutline.svg": "77a3810b2074c81ae84540cd1f62c266",
"assets/assets/icons/arrow.svg": "040ef75eee874b0471c647857a82f095",
"assets/assets/icons/arrow_back.svg": "83af7f77a21b65b2ef76df9b26e1afd0",
"assets/assets/icons/arrow_below.svg": "5c745c5f1ce5a99658e7d4b8d8f0d073",
"assets/assets/icons/backIcon.svg": "3c85494d88887cf41cde228ca69bc215",
"assets/assets/icons/BagIcon.svg": "bae26b0a1963cded5dce14b61cd46aca",
"assets/assets/icons/bell.svg": "4ff90471573c3c2fa5c0cc773d5bd4b9",
"assets/assets/icons/belowIcon.svg": "2b6b95094281dbb0a02d2a8ecad45db3",
"assets/assets/icons/CalendarIcon.svg": "a5317be251c949bd6cb564d8292ea5d7",
"assets/assets/icons/Category.svg": "0846f9d2ffd6e094eba4a51a2cf18e8a",
"assets/assets/icons/Close%2520Square.svg": "d2a5b77674ab9b42b1365e2b795139f4",
"assets/assets/icons/dashboardFilled.svg": "3ccbabee008b43424266331f0153f7fb",
"assets/assets/icons/Delete.svg": "e60b197cc71e4a6f3e3c368eac383220",
"assets/assets/icons/Document.svg": "a9fc92e28c5162d62681d5dbe2f13243",
"assets/assets/icons/documentFilled.svg": "fbd94f977d0eaccd0aa306509861c716",
"assets/assets/icons/DocumentOutline.svg": "bcb340b308b7eeff509da47f82addfc4",
"assets/assets/icons/Downlaod.svg": "4a32851dd8aae7c78522845a2f41334d",
"assets/assets/icons/Edit%2520Square.svg": "bb89650e57cb70cd5d55ab0385e238ae",
"assets/assets/icons/Edit.svg": "f985000e728bc46c710e9fc754c50b40",
"assets/assets/icons/helpOutline.svg": "4c6397fe2a4bf6bee13d144d6c6eda88",
"assets/assets/icons/historyFilledIcon.svg": "741b4923cf3f9d3d0b4ab14dabaf39b2",
"assets/assets/icons/historyOutline.svg": "6bb337fe658ec487d56f74d6b7dd8bce",
"assets/assets/icons/Info%2520Square.svg": "96f5e449856d9a2b3a35eb1708ababc9",
"assets/assets/icons/inventoryIcon.svg": "dc8860d3edba6f4d13522644c7c9a5bf",
"assets/assets/icons/key_icon.svg": "4b426108d2350af8450a6372e377ccc0",
"assets/assets/icons/logo.svg": "acb1236ba1a0bd6f1443b4aedd9c7a82",
"assets/assets/icons/logoutIcon.svg": "29472f3d3564db8a00c5dbd9340b4b3c",
"assets/assets/icons/mail_icon.svg": "4ebf5dd9c276776fd95d372ed6090a2c",
"assets/assets/icons/pdfIcon.svg": "028d82a5fa49460c3e66f4ef8ed2e09e",
"assets/assets/icons/process.svg": "ebb07d0a33cb0fa3738ca1a612b006a8",
"assets/assets/icons/reportIcon.svg": "7c4dfa2f73448f8d2348818d3cc7d5bb",
"assets/assets/icons/servicesIcon.svg": "f4c8aa82e7c80b6306d87f4eed84c732",
"assets/assets/icons/SettingFilled.svg": "30c744e814ab2c0a9cea36a658a8b258",
"assets/assets/icons/SettingOutline.svg": "7d8a5db82502774470f76abff5a5d0d9",
"assets/assets/icons/sidebar_icon.png": "2f84fbc95af85f0a545cf753aaf95b1c",
"assets/assets/icons/Swap.svg": "c58b39143d3a1f8c3e1290aec7f3e009",
"assets/assets/icons/threUsersOutline.svg": "4c7bfbeeb22524775cda9f740a2ee98f",
"assets/assets/icons/Tick%2520Square.svg": "16e829330f4131ad773f5bb1eceae4f6",
"assets/assets/icons/upload.svg": "3832c2efac06ad744ad5af0e811ec5cb",
"assets/assets/icons/Wallet.svg": "67441e9384fe842a7ffc6cc87c9caebb",
"assets/assets/images/card-image.png": "9e8cab9f1282b69eb2892b0000f4e453",
"assets/assets/images/login_bg.png": "c2d68cef58b9be9ad39dde9c7f9975c8",
"assets/assets/images/profile%2520image.png": "4f80e88b8d063ce3ab09b9882a94170f",
"assets/assets/images/stepOne.svg": "bdd066fdfb1d86ccd896064bedacadef",
"assets/assets/images/stepsline.svg": "f927430de4ee510e46abb84dff3ee4f6",
"assets/assets/images/stepsThree.svg": "36af58bc6b5227deb7ea4015d867a3c2",
"assets/assets/images/stepsTwo.svg": "fdbe7dc092f6b124f695922dca550159",
"assets/assets/images/upload_placeholder.png": "2fdf801aaa8f5e017f173d9557c81c7e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "bd84867550fc3068d41f406c831ceda7",
"assets/NOTICES": "8d37c48ab646b78725de9779a90b0dba",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "ccf410348e03eb747027dc28b113690a",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"build/index.html": "4f3b3a94f11d603b1439877e409d7fc4",
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
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "38415b5b529068e2cc88355d025f96ca",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "939d5fb9e286013cdda8317cb2e19db6",
"/": "939d5fb9e286013cdda8317cb2e19db6",
"main.dart.js": "2263a7bc30dd915756fce9dbe8e3d0fd",
"manifest.json": "d1d5fbd8e1426f5f43bb65825140fce2",
"version.json": "66a5435fb594bb71feefc92b0e547b70"};
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
