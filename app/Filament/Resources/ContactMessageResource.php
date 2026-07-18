<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ContactMessageResource\Pages;
use App\Models\ContactMessage;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class ContactMessageResource extends Resource
{
    protected static ?string $model = ContactMessage::class;

    protected static ?string $navigationIcon = 'heroicon-o-envelope';

    protected static ?string $navigationGroup = 'Organization';

    protected static bool $isScopedToTenant = false;

    public static function canCreate(): bool
    {
        return false;
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('department_id')
                    ->label('Department')
                    ->relationship('department', 'name')
                    ->placeholder('General inquiry')
                    ->disabled(),
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255)
                    ->disabled(),
                Forms\Components\TextInput::make('email')
                    ->email()
                    ->required()
                    ->maxLength(255)
                    ->disabled(),
                Forms\Components\TextInput::make('phone')
                    ->tel()
                    ->maxLength(255)
                    ->disabled(),
                Forms\Components\Textarea::make('message')
                    ->required()
                    ->columnSpanFull()
                    ->disabled(),
                Forms\Components\Toggle::make('is_read'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->defaultSort('created_at', 'desc')
            ->columns([
                Tables\Columns\IconColumn::make('is_read')
                    ->boolean()
                    ->label('Read'),
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('department.name')
                    ->placeholder('General')
                    ->badge(),
                Tables\Columns\TextColumn::make('email')
                    ->searchable(),
                Tables\Columns\TextColumn::make('phone'),
                Tables\Columns\TextColumn::make('message')
                    ->limit(50),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable(),
            ])
            ->actions([
                Tables\Actions\EditAction::make()
                    ->label('View'),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListContactMessages::route('/'),
            'edit' => Pages\EditContactMessage::route('/{record}/edit'),
        ];
    }
}
