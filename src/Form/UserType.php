<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class UserType extends AbstractType
{

    
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email')
            // ->add('roles')
            // ->add('password')
            ->add('name')
            ->add('pseudo')
            ->add('birthdate', DateType::class, array(
                'widget' => 'choice',
                'years' => range(date('Y')-100, date('Y')),
                'months' => range(date('m'), 12),
                'days' => range(1, 31),
              ))
            ->add('picture')
            ->add('biography')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
