<?php

namespace App\DataFixtures;

use App\Entity\User;
use DateTime;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class AppFixtures extends Fixture
{
    private $hasher;

    public function __construct(UserPasswordHasherInterface $hasher)
    {
        $this->hasher = $hasher;
    }

    public function load(ObjectManager $manager): void
    {
        $user = new User();
        $user->setName('Payet')
            ->setEMail('sechs@mail.com')
            ->setPassword($this->hasher->hashPassword($user, 'password'))
            ->setPseudo('Sechs')
            ->setpicture('https://randomuser.me/api/portraits/lego/1.jpg')
            ->setBirthdate(\DateTime::createFromFormat('Y-m-d', '1990-01-01'))
            ->setBiography('Toujours regarder sous le lit avant d\'aller dormir')
            ->setRoles(['ROLE_ADMIN']);

        $manager->persist($user);

        $manager->flush();
    }
}
