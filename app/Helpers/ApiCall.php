<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Config;
use App\Helpers\ErrorLogger;

class ApiCall
{
    public static function post($url, array $params)
    {
        $headers = [
            'Accept'        => 'application/json',
        ];

        try {
            $client = new \GuzzleHttp\Client(['base_uri' => 'https://www.anapioficeandfire.com/', 'verify' => false ]);
            $response = $client->request('POST', $url, ['headers' => $headers, 'json' => $params]);
            return $response = json_decode($response->getBody(), true);
        } catch (\Throwable $th) {
            return false;
        }
    }

    public static function get($url)
    {
        $headers = [
            'Accept'        => 'application/json',
        ];

        $client = new \GuzzleHttp\Client(['base_uri' => 'https://www.anapioficeandfire.com/', 'verify' => false ]);
        $response = $client->request('GET', $url, ['headers' => $headers]);
        return $response = json_decode($response->getBody(), true);
    }

    public static function put($url, array $params)
    {
        $headers = [
            'Accept'        => 'application/json',
        ];

        $client = new \GuzzleHttp\Client(['base_uri' => 'https://www.anapioficeandfire.com/', 'verify' => false ]);
        $response = $client->request('PUT', $url, ['headers' => $headers, 'json' => $params]);
        return $response = json_decode($response->getBody(), true);
    }

    public static function putCalls($url, $params)
    {
        $auth = Config::get('ominiConfig.token');
        $headers = ['Authorization' => $auth, 'Accept' => 'application/json'];
        try {
            $client = new \GuzzleHttp\Client(['verify' => false ]);
            $response = $client->request('PUT', $url, ['headers' => $headers, 'json' => $params]);
            $response = json_decode($response->getBody(), true);
            return ['status' => true, 'data' => $response];
        } catch (\GuzzleHttp\Exception\ClientException $e) {
            ErrorLogger::log("UBA marketplace product update errors", $e);
            $response = json_decode($e->getResponse()->getBody(), true);
            return ['status' => false, 'data' => $response];
        }
    }
}
