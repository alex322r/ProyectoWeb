<?php

namespace App;

class Config
{
    private static $config = null;
    private static $config_file = __DIR__ . '/../storage/config.json';

    private static function load()
    {
        if (self::$config === null) {
            if (file_exists(self::$config_file)) {
                $content = file_get_contents(self::$config_file);
                self::$config = json_decode($content, true);
            } else {
                self::$config = [];
            }
        }
    }

    public static function get($key, $default = null)
    {
        self::load();
        $keys = explode('.', $key);
        $value = self::$config;
        foreach ($keys as $k) {
            if (!isset($value[$k])) {
                return $default;
            }
            $value = $value[$k];
        }
        return $value;
    }

    public static function all()
    {
        self::load();
        return self::$config;
    }

    public static function write($new_config)
    {
        self::$config = $new_config;
        file_put_contents(self::$config_file, json_encode(self::$config, JSON_PRETTY_PRINT));
    }
}
