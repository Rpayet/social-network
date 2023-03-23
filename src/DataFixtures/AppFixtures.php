<?php

namespace App\DataFixtures;

use App\Entity\Post;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Faker\Factory as FakerFactory;

class AppFixtures extends Fixture
{
    private $hasher;

    public function __construct(UserPasswordHasherInterface $hasher)
    {
        $this->hasher = $hasher;
    }

    public function load(ObjectManager $manager): void
    {
        // $user = new User();
        // $user->setName('Payet')
        //     ->setEMail('sechs@mail.com')
        //     ->setPassword($this->hasher->hashPassword($user, 'password'))
        //     ->setPseudo('Sechs')
        //     ->setpicture('https://randomuser.me/api/portraits/lego/1.jpg')
        //     ->setBirthdate(\DateTime::createFromFormat('Y-m-d', '1990-01-01'))
        //     ->setBiography('Toujours regarder sous le lit avant d\'aller dormir')
        //     ->setRoles(['ROLE_ADMIN']);

        // $manager->persist($user);
        
        $faker = FakerFactory::create('fr_FR');

        for ($i= 0; $i < 8; $i++) {
            $user = new User();
            $user->setName($faker->name())
                ->setEmail($faker->email())
                ->setPassword($faker->password())
                ->setPseudo(implode("-", $user->getName()))
                ->setPicture('https://randomuser.me/api/portraits/lego/'.$i.'.jpg')
                ->setBirthdate(\DateTime::createFromFormat('Y-m-d', $faker->date()))
                ->setBiography($faker->text())
                ->setRoles(['ROLE_USER']);

            $post = new Post();
            $post->setContent($faker->text())
                ->setCreatedAt(\DateTimeImmutable::createFromMutable($faker->dateTime()))
                ->setUser($user);
        }

        $manager->flush();
    }
}
