<?php

namespace App;

use Carbon\Carbon;

use function dirname;
use function imagecolorallocate;
use function imagecreatetruecolor;
use function imagedestroy;
use function imagefilledrectangle;
use function imagepng;
use function imagettftext;

class ImageCreator
{
    protected $img;
    protected int $white;
    protected int $yourColor;
    protected int $yourColor2;
    protected string $text;
    protected string $text2;
    protected string $font;


    public function __construct(
        array  $yourColor = [128, 128, 128],
        array  $yourColor2 = [60, 80, 57],
        string $text = "DEVOPS",
        string $text2 = "Une superbe image"
    ) {
        // Création d'une image de 400x200 pixels
        $this->img = imagecreatetruecolor(600, 200);
        $this->white = $this->allocateColor([255, 255, 255]);
        $this->yourColor = $this->allocateColor($yourColor);
        $this->yourColor2 = $this->allocateColor($yourColor2);

        // Le texte
        $this->text = $text . ' - ' . (new Carbon())->format('Y-m-d H:i:s');
        $this->text2 = $text2;

        if (!empty($_ENV['APP_SECRET'])) {
            $this->text2 .= ' (secret: ' . $_ENV['APP_SECRET'] . ')';
        }

        // La police
        $this->font = dirname(__DIR__) . '/public/font/consolas.ttf';
    }


    private function allocateColor(array $rgb): false|int
    {
        return imagecolorallocate($this->img, ...$rgb);
    }


    public function createImage(): void
    {
        // Dessine un double rectangle
        imagefilledrectangle($this->img, 0, 0, 600, 200, $this->yourColor);
        imagefilledrectangle($this->img, 10, 10, 590, 190, $this->yourColor2);

        // Ajout du texte
        imagettftext($this->img, 20, 0, 50, 50, $this->white, $this->font, $this->text);
        imagettftext($this->img, 12, 0, 50, 80, $this->white, $this->font, $this->text2);

        // Sauvegarde l'image
        imagepng($this->img);
        imagedestroy($this->img);
    }
}