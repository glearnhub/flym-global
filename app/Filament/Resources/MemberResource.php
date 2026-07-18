<?php

namespace App\Filament\Resources;

use App\Filament\Resources\MemberResource\Pages;
use App\Models\Member;
use App\Models\University;
use Filament\Facades\Filament;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class MemberResource extends Resource
{
    protected static ?string $model = Member::class;

    protected static ?string $navigationIcon = 'heroicon-o-user-group';

    protected static ?string $navigationGroup = 'Department Activities';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('full_name')
                    ->required()
                    ->maxLength(255),
                Forms\Components\Select::make('university_id')
                    ->label('University')
                    ->options(fn () => University::query()
                        ->where('department_id', Filament::getTenant()?->id)
                        ->pluck('name', 'id'))
                    ->searchable()
                    ->visible(fn () => Filament::getTenant()?->isBreachRepairers())
                    ->default(null),
                Forms\Components\TextInput::make('phone_number')
                    ->tel()
                    ->maxLength(255)
                    ->default(null),
                Forms\Components\TextInput::make('email')
                    ->email()
                    ->maxLength(255)
                    ->default(null),
                Forms\Components\FileUpload::make('photo')
                    ->image()
                    ->directory('members')
                    ->default(null),
                Forms\Components\DatePicker::make('joined_at'),
                Forms\Components\TextInput::make('sort_order')
                    ->required()
                    ->numeric()
                    ->default(0),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->defaultSort('sort_order')
            ->columns([
                Tables\Columns\ImageColumn::make('photo')
                    ->circular(),
                Tables\Columns\TextColumn::make('full_name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('university.name')
                    ->placeholder('—')
                    ->visible(fn () => Filament::getTenant()?->isBreachRepairers())
                    ->sortable(),
                Tables\Columns\TextColumn::make('phone_number')
                    ->searchable(),
                Tables\Columns\TextColumn::make('email')
                    ->searchable(),
                Tables\Columns\TextColumn::make('joined_at')
                    ->date()
                    ->sortable(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
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
            'index' => Pages\ListMembers::route('/'),
            'create' => Pages\CreateMember::route('/create'),
            'edit' => Pages\EditMember::route('/{record}/edit'),
        ];
    }
}
